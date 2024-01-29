module TD.Query.SetSavedMessagesTagLabel
  (SetSavedMessagesTagLabel(..)
  , defaultSetSavedMessagesTagLabel
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType
import qualified Data.Text as T

-- | Changes label of a Saved Messages tag; for Telegram Premium users only. Returns 'TD.Data.Ok.Ok'
data SetSavedMessagesTagLabel
  = SetSavedMessagesTagLabel
    { tag   :: Maybe ReactionType.ReactionType -- ^ The tag which label will be changed
    , label :: Maybe T.Text                    -- ^ New label for the tag; 0-12 characters
    }
  deriving (Eq, Show)

instance I.ShortShow SetSavedMessagesTagLabel where
  shortShow
    SetSavedMessagesTagLabel
      { tag   = tag_
      , label = label_
      }
        = "SetSavedMessagesTagLabel"
          ++ I.cc
          [ "tag"   `I.p` tag_
          , "label" `I.p` label_
          ]

instance AT.ToJSON SetSavedMessagesTagLabel where
  toJSON
    SetSavedMessagesTagLabel
      { tag   = tag_
      , label = label_
      }
        = A.object
          [ "@type" A..= AT.String "setSavedMessagesTagLabel"
          , "tag"   A..= tag_
          , "label" A..= label_
          ]

defaultSetSavedMessagesTagLabel :: SetSavedMessagesTagLabel
defaultSetSavedMessagesTagLabel =
  SetSavedMessagesTagLabel
    { tag   = Nothing
    , label = Nothing
    }

