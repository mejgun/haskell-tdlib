module TD.Query.DisconnectAffiliateProgram
  (DisconnectAffiliateProgram(..)
  , defaultDisconnectAffiliateProgram
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AffiliateType as AffiliateType
import qualified Data.Text as T

-- | Disconnects an affiliate program from the given affiliate and immediately deactivates its referral link. Returns updated information about the disconnected affiliate program. Returns 'TD.Data.ConnectedAffiliateProgram.ConnectedAffiliateProgram'
data DisconnectAffiliateProgram
  = DisconnectAffiliateProgram
    { affiliate :: Maybe AffiliateType.AffiliateType -- ^ The affiliate to which the affiliate program is connected
    , url       :: Maybe T.Text                      -- ^ The referral link of the affiliate program
    }
  deriving (Eq, Show)

instance I.ShortShow DisconnectAffiliateProgram where
  shortShow
    DisconnectAffiliateProgram
      { affiliate = affiliate_
      , url       = url_
      }
        = "DisconnectAffiliateProgram"
          ++ I.cc
          [ "affiliate" `I.p` affiliate_
          , "url"       `I.p` url_
          ]

instance AT.ToJSON DisconnectAffiliateProgram where
  toJSON
    DisconnectAffiliateProgram
      { affiliate = affiliate_
      , url       = url_
      }
        = A.object
          [ "@type"     A..= AT.String "disconnectAffiliateProgram"
          , "affiliate" A..= affiliate_
          , "url"       A..= url_
          ]

defaultDisconnectAffiliateProgram :: DisconnectAffiliateProgram
defaultDisconnectAffiliateProgram =
  DisconnectAffiliateProgram
    { affiliate = Nothing
    , url       = Nothing
    }

