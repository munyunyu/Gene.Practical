using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Gene.Practical.Models;
using Microsoft.AspNetCore.Authorization;
using Gene.Practical.Data;
using Gene.Practical.Services;
using Microsoft.AspNetCore.Identity;
using Gene.Practical.Extensions;

namespace Gene.Practical.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly IContextRepository context;

        public UserManager<IdentityUser> userManager { get; }

        public HomeController(IContextRepository context, UserManager<IdentityUser> userManager)
        {
            this.context = context;
            this.userManager = userManager;
        }

        /// <summary>
        /// Display registered certificates in the system
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            List<InformationViewModel> information = new List<InformationViewModel>();

            //get all the certificates
            var certificates = await context.GetAsync<tblInfo>();

            foreach (var certificate in certificates)
            {
                //get branch
                var branch = await Task.Run(() => context.Get<tblBranch>((x) => x.Id == certificate.Branch_FK));

                //get user
                var user = await userManager.FindByIdAsync(certificate.User_FK);

                InformationViewModel _information = new InformationViewModel()
                {
                    Branch = branch?.Name,
                    Code = branch.Code,
                    Branch_FK = branch.Id,
                    Id = certificate.Id,
                    Certificate = certificate.Certificate,
                    Created = certificate.Created,
                    Username = user?.Email,
                    User_FK = user?.Id,
                };

                information.Add(_information);
            }

            return View(information);
        }

        /// <summary>
        /// display form for adding certificate and code
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            //get all branch codes
            ViewBag.Branches = await context.GetAsync<tblBranch>();

            //Get logged-in user
            var user = await userManager.GetUserAsync(User);

            InfoViewModel model = new InfoViewModel()
            {
                Certificate = DateTime.Now.GenerateCertificate(),
                Username = user?.Email,
                User_FK = user.Id
            };

            return View(model);
        }

        /// <summary>
        /// Add certicate and brach code to the system
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IActionResult> Create(InfoViewModel model)
        {

            if (ModelState.IsValid)
            {
                //validate if branc code exist
                if(!await Task.Run(() => context.Exist<tblBranch>((x) => x.Id == model.Branch_FK)))
                {
                    ViewBag.ErrorMessage = $"Brach with Id = {model.Branch_FK} cannot be found";
                    return View("NotFound");
                }

                //check if the user exist
                var user = await userManager.FindByIdAsync(model.User_FK);

                if (user == null)
                {
                    ViewBag.ErrorMessage = $"User with Id = {model.User_FK} cannot be found";
                    return View("NotFound");
                }

                //instatiate new instance of tblInfo
                tblInfo table = new tblInfo()
                {
                    Branch_FK = model.Branch_FK,
                    Certificate = model.Certificate,
                    Created = DateTime.Now,
                    Id = Guid.NewGuid().ToString(),
                    User_FK = model.User_FK
                };

                await context.AddAsync<tblInfo>(table);

                return RedirectToAction("index");
            }

            //get all branch codes
            ViewBag.Branches = await context.GetAsync<tblBranch>();

            return View(model);
        }

        /// <summary>
        /// Display all registered branches
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> Branches()
        {
            List<BranchViewModel> information = new List<BranchViewModel>();

            //Get all branches
            var branches = await context.GetAsync<tblBranch>();

            foreach (var branch in branches)
            {
                var user = await userManager.FindByIdAsync(branch.User_FK);

                BranchViewModel _information = new BranchViewModel()
                {
                    Code = branch.Code,
                    Created = branch.Created,
                    Id = branch.Id,
                    Name = branch.Name,
                    Username = user?.Email,
                    User_FK = branch.User_FK
                };

                information.Add(_information);
            }

            return View(information);
        }

        /// <summary>
        /// Display form for adding a branch
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<IActionResult> Branch()
        {
            var user = await userManager.GetUserAsync(User);

            BrancViewModel model = new BrancViewModel()
            {
                Username = user?.Email,
                User_FK = user?.Id
            };

            return View(model);
        }

        /// <summary>
        /// Add branch to the system
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<IActionResult> Branch(BrancViewModel model)
        {
            if (ModelState.IsValid)
            {
                //check if the user exist
                var user = await userManager.FindByIdAsync(model.User_FK);

                if(user == null)
                {
                    ViewBag.ErrorMessage = $"User with Id = {model.User_FK} cannot be found";
                    return View("NotFound");
                }

                //Check if the brach has the same brach code
                if(context.Exist<tblBranch>((x) => x.Code == model.Code))
                {
                    ModelState.AddModelError("", $"Brach code: {model.Code} already exist");
                    return View(model);
                }

                tblBranch table = new tblBranch()
                {
                    Code = model.Code,
                    Created = DateTime.Now,
                    Id = Guid.NewGuid().ToString(),
                    Name = model.Branch,
                    User_FK = model.User_FK
                };

                await context.AddAsync<tblBranch>(table);

                return RedirectToAction("branches");
            }

            return View(model);
        }

    }
}
