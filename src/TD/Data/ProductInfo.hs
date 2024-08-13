module TD.Data.ProductInfo
  (ProductInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.Photo as Photo

data ProductInfo
  = ProductInfo -- ^ Contains information about a product that can be paid with invoice
    { title       :: Maybe T.Text                      -- ^ Product title
    , description :: Maybe FormattedText.FormattedText -- ^ Product description
    , photo       :: Maybe Photo.Photo                 -- ^ Product photo; may be null
    }
  deriving (Eq, Show)

instance I.ShortShow ProductInfo where
  shortShow ProductInfo
    { title       = title_
    , description = description_
    , photo       = photo_
    }
      = "ProductInfo"
        ++ I.cc
        [ "title"       `I.p` title_
        , "description" `I.p` description_
        , "photo"       `I.p` photo_
        ]

instance AT.FromJSON ProductInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "productInfo" -> parseProductInfo v
      _             -> mempty
    
    where
      parseProductInfo :: A.Value -> AT.Parser ProductInfo
      parseProductInfo = A.withObject "ProductInfo" $ \o -> do
        title_       <- o A..:?  "title"
        description_ <- o A..:?  "description"
        photo_       <- o A..:?  "photo"
        pure $ ProductInfo
          { title       = title_
          , description = description_
          , photo       = photo_
          }
  parseJSON _ = mempty

