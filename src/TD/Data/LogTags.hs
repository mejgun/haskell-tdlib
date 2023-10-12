module TD.Data.LogTags where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data LogTags
  = LogTags -- ^ Contains a list of available TDLib internal log tags
    { tags :: Maybe [T.Text] -- ^ List of log tags
    }
  deriving (Eq)

instance Show LogTags where
  show LogTags
    { tags = tags_
    }
      = "LogTags"
        ++ I.cc
        [ "tags" `I.p` tags_
        ]

instance AT.FromJSON LogTags where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "logTags" -> parseLogTags v
      _         -> mempty
    
    where
      parseLogTags :: A.Value -> AT.Parser LogTags
      parseLogTags = A.withObject "LogTags" $ \o -> do
        tags_ <- o A..:?  "tags"
        pure $ LogTags
          { tags = tags_
          }

instance AT.ToJSON LogTags where
  toJSON LogTags
    { tags = tags_
    }
      = A.object
        [ "@type" A..= AT.String "logTags"
        , "tags"  A..= tags_
        ]
