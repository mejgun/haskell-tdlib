module TD.Query.ProcessGiftPurchaseOffer
  (ProcessGiftPurchaseOffer(..)
  , defaultProcessGiftPurchaseOffer
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Handles a pending gift purchase offer. Returns 'TD.Data.Ok.Ok'
data ProcessGiftPurchaseOffer
  = ProcessGiftPurchaseOffer
    { message_id :: Maybe Int  -- ^ Identifier of the message with the gift purchase offer
    , accept     :: Maybe Bool -- ^ Pass true to accept the request; pass false to reject it
    }
  deriving (Eq, Show)

instance I.ShortShow ProcessGiftPurchaseOffer where
  shortShow
    ProcessGiftPurchaseOffer
      { message_id = message_id_
      , accept     = accept_
      }
        = "ProcessGiftPurchaseOffer"
          ++ I.cc
          [ "message_id" `I.p` message_id_
          , "accept"     `I.p` accept_
          ]

instance AT.ToJSON ProcessGiftPurchaseOffer where
  toJSON
    ProcessGiftPurchaseOffer
      { message_id = message_id_
      , accept     = accept_
      }
        = A.object
          [ "@type"      A..= AT.String "processGiftPurchaseOffer"
          , "message_id" A..= message_id_
          , "accept"     A..= accept_
          ]

defaultProcessGiftPurchaseOffer :: ProcessGiftPurchaseOffer
defaultProcessGiftPurchaseOffer =
  ProcessGiftPurchaseOffer
    { message_id = Nothing
    , accept     = Nothing
    }

