using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Gene.Practical.Data;
using Microsoft.EntityFrameworkCore;

namespace Gene.Practical.Services
{
    public interface IContextRepository
    {
        /// <summary>
        /// Add Table[T] to database
        /// </summary>
        /// <typeparam name="T">Table Class</typeparam>
        /// <param name="model">model</param>
        /// <returns></returns>
        Task<T> AddAsync<T>(T model) where T : class, new();

        /// <summary>
        /// Get Table[T] List by query from database
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="func"></param>
        /// <returns></returns>
        IEnumerable<T> GetQuery<T>(Func<T, bool> func) where T : class, new();

        /// <summary>
        /// Get Table[T] List from database
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        Task<IEnumerable<T>> GetAsync<T>() where T : class, new();

        /// <summary>
        /// Get Table[T] from database
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="func"></param>
        /// <returns></returns>
        T Get<T>(Func<T, bool> func) where T : class, new();

        /// <summary>
        /// Delete Table[T] from database, record match query
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="func"></param>
        /// <returns></returns>
        Task<bool> DeleteAsync<T>(Func<T, bool> func) where T : class, new();

        /// <summary>
        /// Check Table[T] record exist, record match query
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="func"></param>
        /// <returns></returns>
        bool Exist<T>(Func<T, bool> func) where T : class, new();

        /// <summary>
        /// Update Table[T] record to the database
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="model"></param>
        /// <returns></returns>
        Task<T> UpdateAsync<T>(T model) where T : class, new();

        /// <summary>
        /// Save entities at one shot
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        Task AddRangeAsync(params object[] entities);
    }

    
}
