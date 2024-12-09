module TD.Data.AffiliateProgramInfo
  (AffiliateProgramInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AffiliateProgramParameters as AffiliateProgramParameters
import qualified TD.Data.StarAmount as StarAmount

data AffiliateProgramInfo
  = AffiliateProgramInfo -- ^ Contains information about an active affiliate program
    { parameters                    :: Maybe AffiliateProgramParameters.AffiliateProgramParameters -- ^ Parameters of the affiliate program
    , end_date                      :: Maybe Int                                                   -- ^ Point in time (Unix timestamp) when the affiliate program will be closed; 0 if the affiliate program isn't scheduled to be closed. If positive, then the program can't be connected using connectChatAffiliateProgram, but active connections will work until the date
    , daily_revenue_per_user_amount :: Maybe StarAmount.StarAmount                                 -- ^ The amount of daily revenue per user in Telegram Stars of the bot that created the affiliate program
    }
  deriving (Eq, Show)

instance I.ShortShow AffiliateProgramInfo where
  shortShow AffiliateProgramInfo
    { parameters                    = parameters_
    , end_date                      = end_date_
    , daily_revenue_per_user_amount = daily_revenue_per_user_amount_
    }
      = "AffiliateProgramInfo"
        ++ I.cc
        [ "parameters"                    `I.p` parameters_
        , "end_date"                      `I.p` end_date_
        , "daily_revenue_per_user_amount" `I.p` daily_revenue_per_user_amount_
        ]

instance AT.FromJSON AffiliateProgramInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "affiliateProgramInfo" -> parseAffiliateProgramInfo v
      _                      -> mempty
    
    where
      parseAffiliateProgramInfo :: A.Value -> AT.Parser AffiliateProgramInfo
      parseAffiliateProgramInfo = A.withObject "AffiliateProgramInfo" $ \o -> do
        parameters_                    <- o A..:?  "parameters"
        end_date_                      <- o A..:?  "end_date"
        daily_revenue_per_user_amount_ <- o A..:?  "daily_revenue_per_user_amount"
        pure $ AffiliateProgramInfo
          { parameters                    = parameters_
          , end_date                      = end_date_
          , daily_revenue_per_user_amount = daily_revenue_per_user_amount_
          }
  parseJSON _ = mempty

