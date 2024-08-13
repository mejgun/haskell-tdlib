module TD.Data.WebApp
  (WebApp(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Animation as Animation

data WebApp
  = WebApp -- ^ Describes a Web App. Use getInternalLink with internalLinkTypeWebApp to share the Web App
    { short_name  :: Maybe T.Text              -- ^ Web App short name
    , title       :: Maybe T.Text              -- ^ Web App title
    , description :: Maybe T.Text              -- ^ Web App description
    , photo       :: Maybe Photo.Photo         -- ^ Web App photo
    , animation   :: Maybe Animation.Animation -- ^ Web App animation; may be null
    }
  deriving (Eq, Show)

instance I.ShortShow WebApp where
  shortShow WebApp
    { short_name  = short_name_
    , title       = title_
    , description = description_
    , photo       = photo_
    , animation   = animation_
    }
      = "WebApp"
        ++ I.cc
        [ "short_name"  `I.p` short_name_
        , "title"       `I.p` title_
        , "description" `I.p` description_
        , "photo"       `I.p` photo_
        , "animation"   `I.p` animation_
        ]

instance AT.FromJSON WebApp where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "webApp" -> parseWebApp v
      _        -> mempty
    
    where
      parseWebApp :: A.Value -> AT.Parser WebApp
      parseWebApp = A.withObject "WebApp" $ \o -> do
        short_name_  <- o A..:?  "short_name"
        title_       <- o A..:?  "title"
        description_ <- o A..:?  "description"
        photo_       <- o A..:?  "photo"
        animation_   <- o A..:?  "animation"
        pure $ WebApp
          { short_name  = short_name_
          , title       = title_
          , description = description_
          , photo       = photo_
          , animation   = animation_
          }
  parseJSON _ = mempty

