module Web.View.Posts.Show where
import Web.View.Prelude

data ShowView = ShowView { post :: Post }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1 class="display-4">{post.title}</h1>
        <p class="fs-6 text-muted">Last updated {post.updatedAt |> timeAgo}</p>
        <p>{post.body}</p>
    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Posts" PostsAction
                            , breadcrumbText "Show Post"
                            ]
