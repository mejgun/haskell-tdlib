module TD.Query.BanGroupCallParticipants
  (BanGroupCallParticipants(..)
  , defaultBanGroupCallParticipants
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Bans users from a group call not bound to a chat; requires groupCall.is_owned. Only the owner of the group call can invite the banned users back. Returns 'TD.Data.Ok.Ok'
data BanGroupCallParticipants
  = BanGroupCallParticipants
    { group_call_id :: Maybe Int   -- ^ Group call identifier
    , user_ids      :: Maybe [Int] -- ^ Identifiers of group call participants to ban; identifiers of unknown users from the update updateGroupCallParticipants can be also passed to the method
    }
  deriving (Eq, Show)

instance I.ShortShow BanGroupCallParticipants where
  shortShow
    BanGroupCallParticipants
      { group_call_id = group_call_id_
      , user_ids      = user_ids_
      }
        = "BanGroupCallParticipants"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          , "user_ids"      `I.p` user_ids_
          ]

instance AT.ToJSON BanGroupCallParticipants where
  toJSON
    BanGroupCallParticipants
      { group_call_id = group_call_id_
      , user_ids      = user_ids_
      }
        = A.object
          [ "@type"         A..= AT.String "banGroupCallParticipants"
          , "group_call_id" A..= group_call_id_
          , "user_ids"      A..= fmap (fmap I.writeInt64 ) user_ids_
          ]

defaultBanGroupCallParticipants :: BanGroupCallParticipants
defaultBanGroupCallParticipants =
  BanGroupCallParticipants
    { group_call_id = Nothing
    , user_ids      = Nothing
    }

