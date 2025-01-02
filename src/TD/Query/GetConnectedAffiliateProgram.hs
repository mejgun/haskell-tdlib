module TD.Query.GetConnectedAffiliateProgram
  (GetConnectedAffiliateProgram(..)
  , defaultGetConnectedAffiliateProgram
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AffiliateType as AffiliateType

-- | Returns an affiliate program that were connected to the given affiliate by identifier of the bot that created the program. Returns 'TD.Data.ConnectedAffiliateProgram.ConnectedAffiliateProgram'
data GetConnectedAffiliateProgram
  = GetConnectedAffiliateProgram
    { affiliate   :: Maybe AffiliateType.AffiliateType -- ^ The affiliate to which the affiliate program will be connected
    , bot_user_id :: Maybe Int                         -- ^ Identifier of the bot that created the program
    }
  deriving (Eq, Show)

instance I.ShortShow GetConnectedAffiliateProgram where
  shortShow
    GetConnectedAffiliateProgram
      { affiliate   = affiliate_
      , bot_user_id = bot_user_id_
      }
        = "GetConnectedAffiliateProgram"
          ++ I.cc
          [ "affiliate"   `I.p` affiliate_
          , "bot_user_id" `I.p` bot_user_id_
          ]

instance AT.ToJSON GetConnectedAffiliateProgram where
  toJSON
    GetConnectedAffiliateProgram
      { affiliate   = affiliate_
      , bot_user_id = bot_user_id_
      }
        = A.object
          [ "@type"       A..= AT.String "getConnectedAffiliateProgram"
          , "affiliate"   A..= affiliate_
          , "bot_user_id" A..= bot_user_id_
          ]

defaultGetConnectedAffiliateProgram :: GetConnectedAffiliateProgram
defaultGetConnectedAffiliateProgram =
  GetConnectedAffiliateProgram
    { affiliate   = Nothing
    , bot_user_id = Nothing
    }

