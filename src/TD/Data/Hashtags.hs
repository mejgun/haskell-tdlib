module TD.Data.Hashtags
  (Hashtags(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data Hashtags
  = Hashtags -- ^ Contains a list of hashtags
    { hashtags :: Maybe [T.Text] -- ^ A list of hashtags
    }
  deriving (Eq, Show)

instance I.ShortShow Hashtags where
  shortShow Hashtags
    { hashtags = hashtags_
    }
      = "Hashtags"
        ++ I.cc
        [ "hashtags" `I.p` hashtags_
        ]

instance AT.FromJSON Hashtags where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "hashtags" -> parseHashtags v
      _          -> mempty
    
    where
      parseHashtags :: A.Value -> AT.Parser Hashtags
      parseHashtags = A.withObject "Hashtags" $ \o -> do
        hashtags_ <- o A..:?  "hashtags"
        pure $ Hashtags
          { hashtags = hashtags_
          }
  parseJSON _ = mempty

