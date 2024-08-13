module TD.Data.PageBlockRelatedArticle
  (PageBlockRelatedArticle(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Photo as Photo

data PageBlockRelatedArticle
  = PageBlockRelatedArticle -- ^ Contains information about a related article
    { url          :: Maybe T.Text      -- ^ Related article URL
    , title        :: Maybe T.Text      -- ^ Article title; may be empty
    , description  :: Maybe T.Text      -- ^ Article description; may be empty
    , photo        :: Maybe Photo.Photo -- ^ Article photo; may be null
    , author       :: Maybe T.Text      -- ^ Article author; may be empty
    , publish_date :: Maybe Int         -- ^ Point in time (Unix timestamp) when the article was published; 0 if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow PageBlockRelatedArticle where
  shortShow PageBlockRelatedArticle
    { url          = url_
    , title        = title_
    , description  = description_
    , photo        = photo_
    , author       = author_
    , publish_date = publish_date_
    }
      = "PageBlockRelatedArticle"
        ++ I.cc
        [ "url"          `I.p` url_
        , "title"        `I.p` title_
        , "description"  `I.p` description_
        , "photo"        `I.p` photo_
        , "author"       `I.p` author_
        , "publish_date" `I.p` publish_date_
        ]

instance AT.FromJSON PageBlockRelatedArticle where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pageBlockRelatedArticle" -> parsePageBlockRelatedArticle v
      _                         -> mempty
    
    where
      parsePageBlockRelatedArticle :: A.Value -> AT.Parser PageBlockRelatedArticle
      parsePageBlockRelatedArticle = A.withObject "PageBlockRelatedArticle" $ \o -> do
        url_          <- o A..:?  "url"
        title_        <- o A..:?  "title"
        description_  <- o A..:?  "description"
        photo_        <- o A..:?  "photo"
        author_       <- o A..:?  "author"
        publish_date_ <- o A..:?  "publish_date"
        pure $ PageBlockRelatedArticle
          { url          = url_
          , title        = title_
          , description  = description_
          , photo        = photo_
          , author       = author_
          , publish_date = publish_date_
          }
  parseJSON _ = mempty

