﻿//####################################################################
// Project:         10Perals
// Author:          Jonathan Dávila A.
// DATA:            05/10/2019
// Comment:         Managment of repository
//####################################################################
namespace InfoClient.DM.Repository
{
    using InfoClient.DM.Database;
    using Microsoft.EntityFrameworkCore;
    using Microsoft.EntityFrameworkCore.Query;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Linq.Expressions;
    using System.Text;

    public class BaseRepository<TEntity> : IBaseRepository<TEntity> where TEntity : class
    {
        protected _10PearlBDClientContext Db = new _10PearlBDClientContext();
        protected DbSet<TEntity> Data;

        //Constructor
        public BaseRepository(_10PearlBDClientContext _Db)
        {
            Db = _Db;
            Data = Db.Set<TEntity>();
        }

        public void Create(TEntity entity)
        {
            Data.Add(entity);
            Db.SaveChanges();
        }

        public void Update(TEntity entity)
        {
            Data.Attach(entity);
            var entry = Db.Entry(entity);
            entry.State = EntityState.Modified;
            Db.SaveChanges();
        }

        public void Delete(TEntity entity)
        {
            Data.Remove(entity);
            Db.SaveChanges();
        }

        public TEntity FindById(object id)
        {
            return Data.Find(id);
        }

        public IQueryable<TEntity> GetAll()
        {
            return Data;
        }

        public IQueryable<TEntity> GetAllBy(Expression<Func<TEntity, bool>> predicate)
        {
            IQueryable<TEntity> query = Data.AsNoTracking().Where(predicate);
            return query;
        }

        public IQueryable<TEntity> QueryObjectGraph(Expression<Func<TEntity, bool>> filter, string children)
        {
            IQueryable<TEntity> query = Data.Include(children).Where(filter);
            return query;
        }

        public List<TEntity> Get(Func<IQueryable<TEntity>, IIncludableQueryable<TEntity, object>> include = null)
        {
            var result = Data.AsQueryable();

            if (include != null)
                result = include(result);

            return result.ToList();
        }
    }
}
