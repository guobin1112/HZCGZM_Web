using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace HZCGZM_Web
{
    public class Utility
    {
        /// <summary>
        /// 返回分页页码HTML布局
        /// </summary>
        /// <param name="pageSize">页面大小</param>
        /// <param name="pageIndex">当前页</param>
        /// <param name="totalCount">总记录数</param>
        /// <param name="centSize">中间页码数量</param>
        /// <returns>返回页码的html代码</returns>
        static public string GetPageList(int pageSize, int pageIndex, int totalCount, string pageUrl, int centSize)
        {
            int pageCount = totalCount / pageSize;
            //排除异常数据
            if (totalCount < 1 || pageSize < 1)
            {
                return "";
            }
            if (pageCount < 1)
            {
                return "";
            }
            if (pageCount <= 1)
            {
                return "";
            }

            if (totalCount % pageSize > 0)
            {
                pageCount += 1;
            }

            StringBuilder pageStr = new StringBuilder();
            if (pageCount <= centSize)
            {
                for (int i = 1; i <= pageCount; i++)
                {
                    if (i == pageIndex)
                    {
                        pageStr.Append("<a class='current' href='" + pageUrl + i.ToString() + "'>" + i.ToString() + "</a>");
                    }
                    else
                    {
                        pageStr.Append("<a href='" + pageUrl + i.ToString() + "'>" + i.ToString() + "</a>");
                    }
                }
            }
            else
            {
                string firstBtn = "<a href='" + pageUrl + (pageIndex - 1).ToString() + "'>«</a>";
                string lastBtn = "<a href='" + pageUrl + (pageIndex + 1).ToString() + "'>»</a>";
                string firstStr = "<a href='" + pageUrl + "1" + "'>1</a>";
                string lastStr = "<a href='" + pageUrl + pageCount.ToString() + "'>" + pageCount.ToString() + "</a>";

                if (pageIndex <= 1)
                {
                    firstBtn = "<a class=\"disabled\" href='#'>«</a>";
                }
                if (pageIndex >= pageCount)
                {
                    lastBtn = "<a class=\"disabled\" href='#'>»</a>";
                }
                if (pageIndex == 1)
                {
                    firstStr = "<a class=\"current\" href='#'>1</a>";
                }
                if (pageIndex == pageCount)
                {
                    lastStr = "<a class=\"current\" href='#'>" + pageCount.ToString() + "</a>";
                }
                int firstNum = pageIndex - (centSize / 2); //中间开始的页码
                if (pageIndex < centSize)
                    firstNum = 2;
                int lastNum = pageIndex + centSize - ((centSize / 2) + 1); //中间结束的页码
                if (lastNum >= pageCount)
                    lastNum = pageCount - 1;
                pageStr.Append(firstBtn + firstStr);
                if (pageIndex >= centSize)
                {
                    pageStr.Append("<a href='#'>...</a>\n");
                }
                for (int i = firstNum; i <= lastNum; i++)
                {
                    if (i == pageIndex)
                    {
                        pageStr.Append("<a class=\"current\" href='#' >" + i + "</a>");
                    }
                    else
                    {
                        pageStr.Append("<a href='" + pageUrl + i.ToString() + "'>" + i.ToString() + "</a>");
                    }
                }
                if (pageCount - pageIndex > centSize - ((centSize / 2)))
                {
                    pageStr.Append("<a href='#'>...</a>");
                }
                pageStr.Append(lastStr + lastBtn);
            }
            return pageStr.ToString();
        }
    }
}