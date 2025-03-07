module TD.Query.SetPinnedGifts
  (SetPinnedGifts(..)
  , defaultSetPinnedGifts
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T

-- | Changes the list of pinned gifts on the current user's or the channel's profile page; requires can_post_messages administrator right in the channel chat. Returns 'TD.Data.Ok.Ok'
data SetPinnedGifts
  = SetPinnedGifts
    { owner_id          :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or the channel chat that received the gifts
    , received_gift_ids :: Maybe [T.Text]                    -- ^ New list of pinned gifts. All gifts must be upgraded and saved on the profile page first. There can be up to getOption("pinned_gift_count_max") pinned gifts
    }
  deriving (Eq, Show)

instance I.ShortShow SetPinnedGifts where
  shortShow
    SetPinnedGifts
      { owner_id          = owner_id_
      , received_gift_ids = received_gift_ids_
      }
        = "SetPinnedGifts"
          ++ I.cc
          [ "owner_id"          `I.p` owner_id_
          , "received_gift_ids" `I.p` received_gift_ids_
          ]

instance AT.ToJSON SetPinnedGifts where
  toJSON
    SetPinnedGifts
      { owner_id          = owner_id_
      , received_gift_ids = received_gift_ids_
      }
        = A.object
          [ "@type"             A..= AT.String "setPinnedGifts"
          , "owner_id"          A..= owner_id_
          , "received_gift_ids" A..= received_gift_ids_
          ]

defaultSetPinnedGifts :: SetPinnedGifts
defaultSetPinnedGifts =
  SetPinnedGifts
    { owner_id          = Nothing
    , received_gift_ids = Nothing
    }

