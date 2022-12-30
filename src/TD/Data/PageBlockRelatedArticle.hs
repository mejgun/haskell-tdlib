{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PageBlockRelatedArticle where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Photo as Photo
import qualified Utils as U

-- |
data PageBlockRelatedArticle = -- | Contains information about a related article
  PageBlockRelatedArticle
  { -- | Point in time (Unix timestamp) when the article was published; 0 if unknown
    publish_date :: Maybe Int,
    -- | Article author; may be empty
    author :: Maybe String,
    -- | Article photo; may be null
    photo :: Maybe Photo.Photo,
    -- |
    description :: Maybe String,
    -- | Article title; may be empty
    title :: Maybe String,
    -- | Related article URL
    url :: Maybe String
  }
  deriving (Eq)

instance Show PageBlockRelatedArticle where
  show
    PageBlockRelatedArticle
      { publish_date = publish_date_,
        author = author_,
        photo = photo_,
        description = description_,
        title = title_,
        url = url_
      } =
      "PageBlockRelatedArticle"
        ++ U.cc
          [ U.p "publish_date" publish_date_,
            U.p "author" author_,
            U.p "photo" photo_,
            U.p "description" description_,
            U.p "title" title_,
            U.p "url" url_
          ]

instance T.FromJSON PageBlockRelatedArticle where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "pageBlockRelatedArticle" -> parsePageBlockRelatedArticle v
      _ -> mempty
    where
      parsePageBlockRelatedArticle :: A.Value -> T.Parser PageBlockRelatedArticle
      parsePageBlockRelatedArticle = A.withObject "PageBlockRelatedArticle" $ \o -> do
        publish_date_ <- o A..:? "publish_date"
        author_ <- o A..:? "author"
        photo_ <- o A..:? "photo"
        description_ <- o A..:? "description"
        title_ <- o A..:? "title"
        url_ <- o A..:? "url"
        return $ PageBlockRelatedArticle {publish_date = publish_date_, author = author_, photo = photo_, description = description_, title = title_, url = url_}
  parseJSON _ = mempty

instance T.ToJSON PageBlockRelatedArticle where
  toJSON
    PageBlockRelatedArticle
      { publish_date = publish_date_,
        author = author_,
        photo = photo_,
        description = description_,
        title = title_,
        url = url_
      } =
      A.object
        [ "@type" A..= T.String "pageBlockRelatedArticle",
          "publish_date" A..= publish_date_,
          "author" A..= author_,
          "photo" A..= photo_,
          "description" A..= description_,
          "title" A..= title_,
          "url" A..= url_
        ]
