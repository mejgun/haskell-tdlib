module TD.Query.GetConnectedAffiliatePrograms
  (GetConnectedAffiliatePrograms(..)
  , defaultGetConnectedAffiliatePrograms
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AffiliateType as AffiliateType
import qualified Data.Text as T

-- | Returns affiliate programs that were connected to the given affiliate. Returns 'TD.Data.ConnectedAffiliatePrograms.ConnectedAffiliatePrograms'
data GetConnectedAffiliatePrograms
  = GetConnectedAffiliatePrograms
    { affiliate :: Maybe AffiliateType.AffiliateType -- ^ The affiliate to which the affiliate program were connected
    , offset    :: Maybe T.Text                      -- ^ Offset of the first affiliate program to return as received from the previous request; use empty string to get the first chunk of results
    , limit     :: Maybe Int                         -- ^ The maximum number of affiliate programs to return
    }
  deriving (Eq, Show)

instance I.ShortShow GetConnectedAffiliatePrograms where
  shortShow
    GetConnectedAffiliatePrograms
      { affiliate = affiliate_
      , offset    = offset_
      , limit     = limit_
      }
        = "GetConnectedAffiliatePrograms"
          ++ I.cc
          [ "affiliate" `I.p` affiliate_
          , "offset"    `I.p` offset_
          , "limit"     `I.p` limit_
          ]

instance AT.ToJSON GetConnectedAffiliatePrograms where
  toJSON
    GetConnectedAffiliatePrograms
      { affiliate = affiliate_
      , offset    = offset_
      , limit     = limit_
      }
        = A.object
          [ "@type"     A..= AT.String "getConnectedAffiliatePrograms"
          , "affiliate" A..= affiliate_
          , "offset"    A..= offset_
          , "limit"     A..= limit_
          ]

defaultGetConnectedAffiliatePrograms :: GetConnectedAffiliatePrograms
defaultGetConnectedAffiliatePrograms =
  GetConnectedAffiliatePrograms
    { affiliate = Nothing
    , offset    = Nothing
    , limit     = Nothing
    }

