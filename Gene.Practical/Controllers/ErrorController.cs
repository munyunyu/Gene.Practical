using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Mvc;

namespace Gene.Practical.Controllers
{
    [AllowAnonymous]
    public class ErrorController : Controller
    {
        [Route("Error/{statusCode}")]
        public IActionResult HttpStatusCodeHandler(int statusCode)
        {
            var statusCodeResult = HttpContext.Features.Get<IStatusCodeReExecuteFeature>();

            ViewBag.Path = statusCodeResult.OriginalPath ?? string.Empty;
            ViewBag.QueryString = statusCodeResult.OriginalQueryString ?? string.Empty;
            ViewBag.Status = statusCode.ToString() ?? string.Empty;

            string view = string.Empty;

            switch (statusCode)
            {
                case 404:
                    ViewBag.ErrorMessage = "Sorry, the resource you requested could not be found";
                    view = "NotFound";
                    break;
                default:
                    view = "NotFound";
                    break;
            }

            return View(view);
        }

        [Route("Error")]
        [AllowAnonymous]
        public IActionResult Error()
        {
            var exceptionDetails = HttpContext.Features.Get<IExceptionHandlerPathFeature>();

            ViewBag.ExceptionPath = exceptionDetails.Path;
            ViewBag.ExceptionMessage = exceptionDetails.Error.Message;
            //TODO
            //Log stack trace
            //ViewBag.ExceptionStackTrace = exceptionDetails.Error.StackTrace; 

            return View("Error");
        }
    }
}
