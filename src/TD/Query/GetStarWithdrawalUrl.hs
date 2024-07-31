module TD.Query.GetStarWithdrawalUrl
  (GetStarWithdrawalUrl(..)
  , defaultGetStarWithdrawalUrl
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T

-- | Returns a URL for Telegram Star withdrawal. Returns 'TD.Data.HttpUrl.HttpUrl'
data GetStarWithdrawalUrl
  = GetStarWithdrawalUrl
    { owner_id   :: Maybe MessageSender.MessageSender -- ^ Identifier of the owner of the Telegram Stars; can be identifier of an owned bot, or identifier of an owned channel chat
    , star_count :: Maybe Int                         -- ^ The number of Telegram Stars to withdraw. Must be at least getOption("star_withdrawal_count_min")
    , password   :: Maybe T.Text                      -- ^ The 2-step verification password of the current user
    }
  deriving (Eq, Show)

instance I.ShortShow GetStarWithdrawalUrl where
  shortShow
    GetStarWithdrawalUrl
      { owner_id   = owner_id_
      , star_count = star_count_
      , password   = password_
      }
        = "GetStarWithdrawalUrl"
          ++ I.cc
          [ "owner_id"   `I.p` owner_id_
          , "star_count" `I.p` star_count_
          , "password"   `I.p` password_
          ]

instance AT.ToJSON GetStarWithdrawalUrl where
  toJSON
    GetStarWithdrawalUrl
      { owner_id   = owner_id_
      , star_count = star_count_
      , password   = password_
      }
        = A.object
          [ "@type"      A..= AT.String "getStarWithdrawalUrl"
          , "owner_id"   A..= owner_id_
          , "star_count" A..= star_count_
          , "password"   A..= password_
          ]

defaultGetStarWithdrawalUrl :: GetStarWithdrawalUrl
defaultGetStarWithdrawalUrl =
  GetStarWithdrawalUrl
    { owner_id   = Nothing
    , star_count = Nothing
    , password   = Nothing
    }

