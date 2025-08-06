module TD.Data.InputSuggestedPostInfo
  ( InputSuggestedPostInfo(..)    
  , defaultInputSuggestedPostInfo 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SuggestedPostPrice as SuggestedPostPrice

data InputSuggestedPostInfo
  = InputSuggestedPostInfo -- ^ Contains information about a post to suggest
    { price     :: Maybe SuggestedPostPrice.SuggestedPostPrice -- ^ Price of the suggested post; pass null to suggest a post without payment. If the current user isn't an administrator of the channel direct messages chat and has no enough funds to pay for the post, then the error "BALANCE_TOO_LOW" will be returned immediately
    , send_date :: Maybe Int                                   -- ^ Point in time (Unix timestamp) when the post is expected to be published; pass 0 if the date isn't restricted. If specified, then the date must be getOption("suggested_post_send_delay_min")-getOption("suggested_post_send_delay_max") seconds in the future
    }
  deriving (Eq, Show)

instance I.ShortShow InputSuggestedPostInfo where
  shortShow InputSuggestedPostInfo
    { price     = price_
    , send_date = send_date_
    }
      = "InputSuggestedPostInfo"
        ++ I.cc
        [ "price"     `I.p` price_
        , "send_date" `I.p` send_date_
        ]

instance AT.FromJSON InputSuggestedPostInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputSuggestedPostInfo" -> parseInputSuggestedPostInfo v
      _                        -> mempty
    
    where
      parseInputSuggestedPostInfo :: A.Value -> AT.Parser InputSuggestedPostInfo
      parseInputSuggestedPostInfo = A.withObject "InputSuggestedPostInfo" $ \o -> do
        price_     <- o A..:?  "price"
        send_date_ <- o A..:?  "send_date"
        pure $ InputSuggestedPostInfo
          { price     = price_
          , send_date = send_date_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputSuggestedPostInfo where
  toJSON InputSuggestedPostInfo
    { price     = price_
    , send_date = send_date_
    }
      = A.object
        [ "@type"     A..= AT.String "inputSuggestedPostInfo"
        , "price"     A..= price_
        , "send_date" A..= send_date_
        ]

defaultInputSuggestedPostInfo :: InputSuggestedPostInfo
defaultInputSuggestedPostInfo =
  InputSuggestedPostInfo
    { price     = Nothing
    , send_date = Nothing
    }

