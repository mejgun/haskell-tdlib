module TD.Data.AffiliateProgramSortOrder
  (AffiliateProgramSortOrder(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes the order of the found affiliate programs
data AffiliateProgramSortOrder
  = AffiliateProgramSortOrderProfitability -- ^ The affiliate programs must be sorted by the profitability
  | AffiliateProgramSortOrderCreationDate -- ^ The affiliate programs must be sorted by creation date
  | AffiliateProgramSortOrderRevenue -- ^ The affiliate programs must be sorted by the expected revenue
  deriving (Eq, Show)

instance I.ShortShow AffiliateProgramSortOrder where
  shortShow AffiliateProgramSortOrderProfitability
      = "AffiliateProgramSortOrderProfitability"
  shortShow AffiliateProgramSortOrderCreationDate
      = "AffiliateProgramSortOrderCreationDate"
  shortShow AffiliateProgramSortOrderRevenue
      = "AffiliateProgramSortOrderRevenue"

instance AT.FromJSON AffiliateProgramSortOrder where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "affiliateProgramSortOrderProfitability" -> pure AffiliateProgramSortOrderProfitability
      "affiliateProgramSortOrderCreationDate"  -> pure AffiliateProgramSortOrderCreationDate
      "affiliateProgramSortOrderRevenue"       -> pure AffiliateProgramSortOrderRevenue
      _                                        -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON AffiliateProgramSortOrder where
  toJSON AffiliateProgramSortOrderProfitability
      = A.object
        [ "@type" A..= AT.String "affiliateProgramSortOrderProfitability"
        ]
  toJSON AffiliateProgramSortOrderCreationDate
      = A.object
        [ "@type" A..= AT.String "affiliateProgramSortOrderCreationDate"
        ]
  toJSON AffiliateProgramSortOrderRevenue
      = A.object
        [ "@type" A..= AT.String "affiliateProgramSortOrderRevenue"
        ]

