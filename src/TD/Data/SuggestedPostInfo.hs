module TD.Data.SuggestedPostInfo
  (SuggestedPostInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SuggestedPostPrice as SuggestedPostPrice
import qualified TD.Data.SuggestedPostState as SuggestedPostState

data SuggestedPostInfo
  = SuggestedPostInfo -- ^ Contains information about a suggested post. If the post can be approved or declined, then changes to the post can be also suggested. Use sendMessage with reply to the message and suggested post information to suggest message changes. Use addOffer to suggest price or time changes
    { price           :: Maybe SuggestedPostPrice.SuggestedPostPrice -- ^ Price of the suggested post; may be null if the post is non-paid
    , send_date       :: Maybe Int                                   -- ^ Point in time (Unix timestamp) when the post is expected to be published; 0 if the specific date isn't set yet
    , state           :: Maybe SuggestedPostState.SuggestedPostState -- ^ State of the post
    , can_be_approved :: Maybe Bool                                  -- ^ True, if the suggested post can be approved by the current user using approveSuggestedPost; updates aren't sent when value of this field changes
    , can_be_declined :: Maybe Bool                                  -- ^ True, if the suggested post can be declined by the current user using declineSuggestedPost; updates aren't sent when value of this field changes
    }
  deriving (Eq, Show)

instance I.ShortShow SuggestedPostInfo where
  shortShow SuggestedPostInfo
    { price           = price_
    , send_date       = send_date_
    , state           = state_
    , can_be_approved = can_be_approved_
    , can_be_declined = can_be_declined_
    }
      = "SuggestedPostInfo"
        ++ I.cc
        [ "price"           `I.p` price_
        , "send_date"       `I.p` send_date_
        , "state"           `I.p` state_
        , "can_be_approved" `I.p` can_be_approved_
        , "can_be_declined" `I.p` can_be_declined_
        ]

instance AT.FromJSON SuggestedPostInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "suggestedPostInfo" -> parseSuggestedPostInfo v
      _                   -> mempty
    
    where
      parseSuggestedPostInfo :: A.Value -> AT.Parser SuggestedPostInfo
      parseSuggestedPostInfo = A.withObject "SuggestedPostInfo" $ \o -> do
        price_           <- o A..:?  "price"
        send_date_       <- o A..:?  "send_date"
        state_           <- o A..:?  "state"
        can_be_approved_ <- o A..:?  "can_be_approved"
        can_be_declined_ <- o A..:?  "can_be_declined"
        pure $ SuggestedPostInfo
          { price           = price_
          , send_date       = send_date_
          , state           = state_
          , can_be_approved = can_be_approved_
          , can_be_declined = can_be_declined_
          }
  parseJSON _ = mempty

