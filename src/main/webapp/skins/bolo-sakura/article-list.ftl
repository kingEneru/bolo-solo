<#--

    Solo - A small and beautiful blogging system written in Java.
    Copyright (c) 2010-present, b3log.org

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

-->


<#list articles as article>
<article class="post post-list-thumb " itemscope="" itemtype="http://schema.org/BlogPosting">
    <div class="post-thumb">
        <a href="https://2heng.xin/2019/12/31/graphql-recursion/"><img class="lazyload" id="post-th-4491" src="${article.articleImg1URL}" onerror="imgError(this,3)" data-src="${article.articleImg1URL}"></a>
    </div>
    <div class="post-content-wrap">
        <div class="post-content">
            <div class="post-date">
                <i class="iconfont icon-time"></i>${article.articleUpdateDate?string("yyyy年MM月dd日 HH:mm:ss")}
            </div>
            <a href="${servePath}${article.articlePermalink}" class="post-title">
                <h3>${article.articleTitle}</h3>
            </a>
            <div class="post-meta">
                <span><i class="iconfont icon-attention"></i>${article.articleViewCount} 热度</span><span class="comments-number"><i class="iconfont icon-mark"></i><a href="https://2heng.xin/2019/12/31/graphql-recursion/#comments">${article.articleCommentCount} 条评论</a></span><span><i class="iconfont icon-file"></i><a href="https://2heng.xin/archives/hacking/">${article.articleCategory}</a></span>
            </div>
            <div class="float-content">
                <p>
                    ${article.articleAbstractText}
                <div class="post-bottom">
                    <a href="https://2heng.xin/2019/12/31/graphql-recursion/" class="button-normal"><i class="iconfont icon-caidan"></i></a>
                </div>
            </div>
        </div>
    </div>
</article>
</#list>




<div class="article-list">
    <#list articles as article>
    <article class="item <#if article_index &lt; 3>item--active</#if>">
        <time class="vditor-tooltipped vditor-tooltipped__n item__date"
              aria-label="${article.articleUpdateDate?string("yyyy")}${yearLabel}">
            ${article.articleUpdateDate?string("MM")}${monthLabel}
            <span class="item__day">${article.articleUpdateDate?string("dd")}</span>
        </time>

        <h2 class="item__title">
            <a rel="bookmark" href="${servePath}${article.articlePermalink}">
                ${article.articleTitle}
            </a>
            <#if article.articlePutTop>
            <sup>
                ${topArticleLabel}
            </sup>
            </#if>
            <#if article.hasUpdated>
                <sup>
                    ${updatedLabel}
                </sup>
            </#if>
        </h2>

        <div class="item__date--m fn__none">
            <i class="icon__date"></i>
            ${article.articleUpdateDate?string("yyyy-MM-dd")}
        </div>


        <div class="ft__center">
            <#if article.articleCategory != "">
            <span class="tag">
                <i class="icon__category"></i>
                <a rel="tag" href="${servePath}/category/${article.categoryURI}">${article.articleCategory}</a>
            </span>
            </#if>
            <span class="tag">
                <i class="icon__tags"></i>
                <#list article.articleTags?split(",") as articleTag>
                <a rel="tag" href="${servePath}/tags/${articleTag?url('UTF-8')}">
                ${articleTag}</a><#if articleTag_has_next>,</#if>
                </#list>
            </span>
            <a class="tag" href="${servePath}${article.articlePermalink}#comments">
                <i class="icon__comments"></i> ${article.articleCommentCount} ${commentLabel}
            </a>
            <span class="tag">
                <i class="icon__views"></i>
                ${article.articleViewCount} ${viewLabel}
            </span>
        </div>

        <div class="vditor-reset">
            ${article.articleAbstract}
        </div>
    </article>
    </#list>


    <#if 0 != paginationPageCount>
        <div class="fn__clear">
            <nav class="pagination fn__right">
                <#if 1 != paginationPageNums?first>
                    <a href="${servePath}${path}?p=${paginationPreviousPageNum}" class="pagination__item">&laquo;</a>
                    <a class="pagination__item" href="${servePath}${path}">1</a>
                    <span class="pagination__item pagination__item--text">...</span>
                </#if>
                <#list paginationPageNums as paginationPageNum>
                    <#if paginationPageNum == paginationCurrentPageNum>
                    <span class="pagination__item pagination__item--current">${paginationPageNum}</span>
                    <#else>
                    <a class="pagination__item" href="${servePath}${path}?p=${paginationPageNum}">${paginationPageNum}</a>
                    </#if>
                </#list>
                <#if paginationPageNums?last != paginationPageCount>
                    <span class="pagination__item pagination__item--text">...</span>
                    <a href="${servePath}${path}?p=${paginationPageCount}" class="pagination__item">${paginationPageCount}</a>
                    <a href="${servePath}${path}?p=${paginationNextPageNum}" class="pagination__item">&raquo;</a>
                </#if>
            </nav>
        </div>
    </#if>
</div>