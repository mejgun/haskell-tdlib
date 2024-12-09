module TD.Data.AffiliateProgramParameters
  ( AffiliateProgramParameters(..)    
  , defaultAffiliateProgramParameters 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data AffiliateProgramParameters
  = AffiliateProgramParameters -- ^ Describes parameters of an affiliate program
    { commission_per_mille :: Maybe Int -- ^ The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the program owner; getOption("affiliate_program_commission_per_mille_min")-getOption("affiliate_program_commission_per_mille_max")
    , month_count          :: Maybe Int -- ^ Number of months the program will be active; 0-36. If 0, then the program is eternal
    }
  deriving (Eq, Show)

instance I.ShortShow AffiliateProgramParameters where
  shortShow AffiliateProgramParameters
    { commission_per_mille = commission_per_mille_
    , month_count          = month_count_
    }
      = "AffiliateProgramParameters"
        ++ I.cc
        [ "commission_per_mille" `I.p` commission_per_mille_
        , "month_count"          `I.p` month_count_
        ]

instance AT.FromJSON AffiliateProgramParameters where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "affiliateProgramParameters" -> parseAffiliateProgramParameters v
      _                            -> mempty
    
    where
      parseAffiliateProgramParameters :: A.Value -> AT.Parser AffiliateProgramParameters
      parseAffiliateProgramParameters = A.withObject "AffiliateProgramParameters" $ \o -> do
        commission_per_mille_ <- o A..:?  "commission_per_mille"
        month_count_          <- o A..:?  "month_count"
        pure $ AffiliateProgramParameters
          { commission_per_mille = commission_per_mille_
          , month_count          = month_count_
          }
  parseJSON _ = mempty

instance AT.ToJSON AffiliateProgramParameters where
  toJSON AffiliateProgramParameters
    { commission_per_mille = commission_per_mille_
    , month_count          = month_count_
    }
      = A.object
        [ "@type"                A..= AT.String "affiliateProgramParameters"
        , "commission_per_mille" A..= commission_per_mille_
        , "month_count"          A..= month_count_
        ]

defaultAffiliateProgramParameters :: AffiliateProgramParameters
defaultAffiliateProgramParameters =
  AffiliateProgramParameters
    { commission_per_mille = Nothing
    , month_count          = Nothing
    }

