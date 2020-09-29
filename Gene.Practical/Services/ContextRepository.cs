using Gene.Practical.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Gene.Practical.Services
{
    public class ContextRepository : IContextRepository
    {
        private readonly ApplicationDbContext context;

        public ContextRepository(ApplicationDbContext context)
        {
            this.context = context;
        }

        public async Task<T> AddAsync<T>(T model) where T : class, new()
        {
            context.Add(model);
            await context.SaveChangesAsync();
            return model;
        }

        public async Task<bool> DeleteAsync<T>(Func<T, bool> func) where T : class, new()
        {
            var record = context.Set<T>().SingleOrDefault(func);

            context.Remove(record);
            await context.SaveChangesAsync();
            return true;
        }

        public bool Exist<T>(Func<T, bool> func) where T : class, new()
        {
            //TODO change it to Async
            bool result = context.Set<T>().Any(func);
            return result;
        }

        public async Task<IEnumerable<T>> GetAsync<T>() where T : class, new()
        {
            var result = await context.Set<T>().ToListAsync();
            return result;
        }

        public T Get<T>(Func<T, bool> func) where T : class, new()
        {
            //TODO change this to Async
            var response = context.Set<T>().SingleOrDefault(func);
            return response;
        }

        public IEnumerable<T> GetQuery<T>(Func<T, bool> func) where T : class, new()
        {
            var result = context.Set<T>().AsParallel().Where(func);
            return result;
        }

        public async Task<T> UpdateAsync<T>(T model) where T : class, new()
        {
            context.Update(model);
            context.Entry(model).State = EntityState.Modified;
            await context.SaveChangesAsync();
            return model;
        }

        public async Task AddRangeAsync(params object[] entities)
        {
            if (entities == null)
                return;

            await context.AddRangeAsync(entities);
            await context.SaveChangesAsync();
        }
    }
}
