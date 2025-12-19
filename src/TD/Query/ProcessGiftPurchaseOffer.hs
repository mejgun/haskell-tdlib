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
    , approve    :: Maybe Bool -- ^ Pass true to approve the request; pass false to decline it
    }
  deriving (Eq, Show)

instance I.ShortShow ProcessGiftPurchaseOffer where
  shortShow
    ProcessGiftPurchaseOffer
      { message_id = message_id_
      , approve    = approve_
      }
        = "ProcessGiftPurchaseOffer"
          ++ I.cc
          [ "message_id" `I.p` message_id_
          , "approve"    `I.p` approve_
          ]

instance AT.ToJSON ProcessGiftPurchaseOffer where
  toJSON
    ProcessGiftPurchaseOffer
      { message_id = message_id_
      , approve    = approve_
      }
        = A.object
          [ "@type"      A..= AT.String "processGiftPurchaseOffer"
          , "message_id" A..= message_id_
          , "approve"    A..= approve_
          ]

defaultProcessGiftPurchaseOffer :: ProcessGiftPurchaseOffer
defaultProcessGiftPurchaseOffer =
  ProcessGiftPurchaseOffer
    { message_id = Nothing
    , approve    = Nothing
    }

