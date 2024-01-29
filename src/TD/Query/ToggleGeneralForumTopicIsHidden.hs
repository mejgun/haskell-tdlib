module TD.Query.ToggleGeneralForumTopicIsHidden
  (ToggleGeneralForumTopicIsHidden(..)
  , defaultToggleGeneralForumTopicIsHidden
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether a General topic is hidden in a forum supergroup chat; requires can_manage_topics right in the supergroup. Returns 'TD.Data.Ok.Ok'
data ToggleGeneralForumTopicIsHidden
  = ToggleGeneralForumTopicIsHidden
    { chat_id   :: Maybe Int  -- ^ Identifier of the chat
    , is_hidden :: Maybe Bool -- ^ Pass true to hide and close the General topic; pass false to unhide it
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleGeneralForumTopicIsHidden where
  shortShow
    ToggleGeneralForumTopicIsHidden
      { chat_id   = chat_id_
      , is_hidden = is_hidden_
      }
        = "ToggleGeneralForumTopicIsHidden"
          ++ I.cc
          [ "chat_id"   `I.p` chat_id_
          , "is_hidden" `I.p` is_hidden_
          ]

instance AT.ToJSON ToggleGeneralForumTopicIsHidden where
  toJSON
    ToggleGeneralForumTopicIsHidden
      { chat_id   = chat_id_
      , is_hidden = is_hidden_
      }
        = A.object
          [ "@type"     A..= AT.String "toggleGeneralForumTopicIsHidden"
          , "chat_id"   A..= chat_id_
          , "is_hidden" A..= is_hidden_
          ]

defaultToggleGeneralForumTopicIsHidden :: ToggleGeneralForumTopicIsHidden
defaultToggleGeneralForumTopicIsHidden =
  ToggleGeneralForumTopicIsHidden
    { chat_id   = Nothing
    , is_hidden = Nothing
    }

