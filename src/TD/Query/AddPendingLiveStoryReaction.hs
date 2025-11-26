module TD.Query.AddPendingLiveStoryReaction
  (AddPendingLiveStoryReaction(..)
  , defaultAddPendingLiveStoryReaction
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Adds pending paid reaction in a live story group call. Can't be used in live stories posted by the current user. Call commitPendingLiveStoryReactions or removePendingLiveStoryReactions to actually send all pending reactions when the undo timer is over or abort the sending. Returns 'TD.Data.Ok.Ok'
data AddPendingLiveStoryReaction
  = AddPendingLiveStoryReaction
    { group_call_id :: Maybe Int -- ^ Group call identifier
    , star_count    :: Maybe Int -- ^ Number of Telegram Stars to be used for the reaction. The total number of pending paid reactions must not exceed getOption("paid_group_call_message_star_count_max")
    }
  deriving (Eq, Show)

instance I.ShortShow AddPendingLiveStoryReaction where
  shortShow
    AddPendingLiveStoryReaction
      { group_call_id = group_call_id_
      , star_count    = star_count_
      }
        = "AddPendingLiveStoryReaction"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          , "star_count"    `I.p` star_count_
          ]

instance AT.ToJSON AddPendingLiveStoryReaction where
  toJSON
    AddPendingLiveStoryReaction
      { group_call_id = group_call_id_
      , star_count    = star_count_
      }
        = A.object
          [ "@type"         A..= AT.String "addPendingLiveStoryReaction"
          , "group_call_id" A..= group_call_id_
          , "star_count"    A..= star_count_
          ]

defaultAddPendingLiveStoryReaction :: AddPendingLiveStoryReaction
defaultAddPendingLiveStoryReaction =
  AddPendingLiveStoryReaction
    { group_call_id = Nothing
    , star_count    = Nothing
    }

