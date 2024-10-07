module TD.Query.ToggleGiftIsSaved
  (ToggleGiftIsSaved(..)
  , defaultToggleGiftIsSaved
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether a gift is shown on the current user's profile page. Returns 'TD.Data.Ok.Ok'
data ToggleGiftIsSaved
  = ToggleGiftIsSaved
    { sender_user_id :: Maybe Int  -- ^ Identifier of the user that sent the gift
    , message_id     :: Maybe Int  -- ^ Identifier of the message with the gift in the chat with the user
    , is_saved       :: Maybe Bool -- ^ Pass true to display the gift on the user's profile page; pass false to remove it from the profile page
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleGiftIsSaved where
  shortShow
    ToggleGiftIsSaved
      { sender_user_id = sender_user_id_
      , message_id     = message_id_
      , is_saved       = is_saved_
      }
        = "ToggleGiftIsSaved"
          ++ I.cc
          [ "sender_user_id" `I.p` sender_user_id_
          , "message_id"     `I.p` message_id_
          , "is_saved"       `I.p` is_saved_
          ]

instance AT.ToJSON ToggleGiftIsSaved where
  toJSON
    ToggleGiftIsSaved
      { sender_user_id = sender_user_id_
      , message_id     = message_id_
      , is_saved       = is_saved_
      }
        = A.object
          [ "@type"          A..= AT.String "toggleGiftIsSaved"
          , "sender_user_id" A..= sender_user_id_
          , "message_id"     A..= message_id_
          , "is_saved"       A..= is_saved_
          ]

defaultToggleGiftIsSaved :: ToggleGiftIsSaved
defaultToggleGiftIsSaved =
  ToggleGiftIsSaved
    { sender_user_id = Nothing
    , message_id     = Nothing
    , is_saved       = Nothing
    }

