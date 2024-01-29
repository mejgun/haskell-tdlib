module TD.Data.SavedMessagesTags
  (SavedMessagesTags(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SavedMessagesTag as SavedMessagesTag

data SavedMessagesTags
  = SavedMessagesTags -- ^ Contains a list of tags used in Saved Messages
    { tags :: Maybe [SavedMessagesTag.SavedMessagesTag] -- ^ List of tags
    }
  deriving (Eq, Show)

instance I.ShortShow SavedMessagesTags where
  shortShow SavedMessagesTags
    { tags = tags_
    }
      = "SavedMessagesTags"
        ++ I.cc
        [ "tags" `I.p` tags_
        ]

instance AT.FromJSON SavedMessagesTags where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "savedMessagesTags" -> parseSavedMessagesTags v
      _                   -> mempty
    
    where
      parseSavedMessagesTags :: A.Value -> AT.Parser SavedMessagesTags
      parseSavedMessagesTags = A.withObject "SavedMessagesTags" $ \o -> do
        tags_ <- o A..:?  "tags"
        pure $ SavedMessagesTags
          { tags = tags_
          }
  parseJSON _ = mempty

