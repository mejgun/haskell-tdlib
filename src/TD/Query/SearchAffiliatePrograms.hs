module TD.Query.SearchAffiliatePrograms
  (SearchAffiliatePrograms(..)
  , defaultSearchAffiliatePrograms
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AffiliateType as AffiliateType
import qualified TD.Data.AffiliateProgramSortOrder as AffiliateProgramSortOrder
import qualified Data.Text as T

-- | Searches affiliate programs that can be connected to the given affiliate. Returns 'TD.Data.FoundAffiliatePrograms.FoundAffiliatePrograms'
data SearchAffiliatePrograms
  = SearchAffiliatePrograms
    { affiliate  :: Maybe AffiliateType.AffiliateType                         -- ^ The affiliate for which affiliate programs are searched for
    , sort_order :: Maybe AffiliateProgramSortOrder.AffiliateProgramSortOrder -- ^ Sort order for the results
    , offset     :: Maybe T.Text                                              -- ^ Offset of the first affiliate program to return as received from the previous request; use empty string to get the first chunk of results
    , limit      :: Maybe Int                                                 -- ^ The maximum number of affiliate programs to return
    }
  deriving (Eq, Show)

instance I.ShortShow SearchAffiliatePrograms where
  shortShow
    SearchAffiliatePrograms
      { affiliate  = affiliate_
      , sort_order = sort_order_
      , offset     = offset_
      , limit      = limit_
      }
        = "SearchAffiliatePrograms"
          ++ I.cc
          [ "affiliate"  `I.p` affiliate_
          , "sort_order" `I.p` sort_order_
          , "offset"     `I.p` offset_
          , "limit"      `I.p` limit_
          ]

instance AT.ToJSON SearchAffiliatePrograms where
  toJSON
    SearchAffiliatePrograms
      { affiliate  = affiliate_
      , sort_order = sort_order_
      , offset     = offset_
      , limit      = limit_
      }
        = A.object
          [ "@type"      A..= AT.String "searchAffiliatePrograms"
          , "affiliate"  A..= affiliate_
          , "sort_order" A..= sort_order_
          , "offset"     A..= offset_
          , "limit"      A..= limit_
          ]

defaultSearchAffiliatePrograms :: SearchAffiliatePrograms
defaultSearchAffiliatePrograms =
  SearchAffiliatePrograms
    { affiliate  = Nothing
    , sort_order = Nothing
    , offset     = Nothing
    , limit      = Nothing
    }

