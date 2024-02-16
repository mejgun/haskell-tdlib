module TD.Data.SavedMessagesTag
  (SavedMessagesTag(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType
import qualified Data.Text as T

data SavedMessagesTag
  = SavedMessagesTag -- ^ Represents a tag used in Saved Messages or a Saved Messages topic
    { tag   :: Maybe ReactionType.ReactionType -- ^ The tag
    , label :: Maybe T.Text                    -- ^ Label of the tag; 0-12 characters. Always empty if the tag is returned for a Saved Messages topic
    , count :: Maybe Int                       -- ^ Number of times the tag was used; may be 0 if the tag has non-empty label
    }
  deriving (Eq, Show)

instance I.ShortShow SavedMessagesTag where
  shortShow SavedMessagesTag
    { tag   = tag_
    , label = label_
    , count = count_
    }
      = "SavedMessagesTag"
        ++ I.cc
        [ "tag"   `I.p` tag_
        , "label" `I.p` label_
        , "count" `I.p` count_
        ]

instance AT.FromJSON SavedMessagesTag where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "savedMessagesTag" -> parseSavedMessagesTag v
      _                  -> mempty
    
    where
      parseSavedMessagesTag :: A.Value -> AT.Parser SavedMessagesTag
      parseSavedMessagesTag = A.withObject "SavedMessagesTag" $ \o -> do
        tag_   <- o A..:?  "tag"
        label_ <- o A..:?  "label"
        count_ <- o A..:?  "count"
        pure $ SavedMessagesTag
          { tag   = tag_
          , label = label_
          , count = count_
          }
  parseJSON _ = mempty

