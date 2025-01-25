module TD.Query.ToggleGiftIsSaved
  (ToggleGiftIsSaved(..)
  , defaultToggleGiftIsSaved
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Toggles whether a gift is shown on the current user's or the channel's profile page; requires can_post_messages administrator right in the chat. Returns 'TD.Data.Ok.Ok'
data ToggleGiftIsSaved
  = ToggleGiftIsSaved
    { received_gift_id :: Maybe T.Text -- ^ Identifier of the gift
    , is_saved         :: Maybe Bool   -- ^ Pass true to display the gift on the user's or the channel's profile page; pass false to remove it from the profile page
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleGiftIsSaved where
  shortShow
    ToggleGiftIsSaved
      { received_gift_id = received_gift_id_
      , is_saved         = is_saved_
      }
        = "ToggleGiftIsSaved"
          ++ I.cc
          [ "received_gift_id" `I.p` received_gift_id_
          , "is_saved"         `I.p` is_saved_
          ]

instance AT.ToJSON ToggleGiftIsSaved where
  toJSON
    ToggleGiftIsSaved
      { received_gift_id = received_gift_id_
      , is_saved         = is_saved_
      }
        = A.object
          [ "@type"            A..= AT.String "toggleGiftIsSaved"
          , "received_gift_id" A..= received_gift_id_
          , "is_saved"         A..= is_saved_
          ]

defaultToggleGiftIsSaved :: ToggleGiftIsSaved
defaultToggleGiftIsSaved =
  ToggleGiftIsSaved
    { received_gift_id = Nothing
    , is_saved         = Nothing
    }

