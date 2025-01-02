module TD.Query.ConnectAffiliateProgram
  (ConnectAffiliateProgram(..)
  , defaultConnectAffiliateProgram
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AffiliateType as AffiliateType

-- | Connects an affiliate program to the given affiliate. Returns information about the connected affiliate program. Returns 'TD.Data.ConnectedAffiliateProgram.ConnectedAffiliateProgram'
data ConnectAffiliateProgram
  = ConnectAffiliateProgram
    { affiliate   :: Maybe AffiliateType.AffiliateType -- ^ The affiliate to which the affiliate program will be connected
    , bot_user_id :: Maybe Int                         -- ^ Identifier of the bot, which affiliate program is connected
    }
  deriving (Eq, Show)

instance I.ShortShow ConnectAffiliateProgram where
  shortShow
    ConnectAffiliateProgram
      { affiliate   = affiliate_
      , bot_user_id = bot_user_id_
      }
        = "ConnectAffiliateProgram"
          ++ I.cc
          [ "affiliate"   `I.p` affiliate_
          , "bot_user_id" `I.p` bot_user_id_
          ]

instance AT.ToJSON ConnectAffiliateProgram where
  toJSON
    ConnectAffiliateProgram
      { affiliate   = affiliate_
      , bot_user_id = bot_user_id_
      }
        = A.object
          [ "@type"       A..= AT.String "connectAffiliateProgram"
          , "affiliate"   A..= affiliate_
          , "bot_user_id" A..= bot_user_id_
          ]

defaultConnectAffiliateProgram :: ConnectAffiliateProgram
defaultConnectAffiliateProgram =
  ConnectAffiliateProgram
    { affiliate   = Nothing
    , bot_user_id = Nothing
    }

