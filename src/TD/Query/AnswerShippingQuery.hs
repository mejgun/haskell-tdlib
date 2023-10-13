module TD.Query.AnswerShippingQuery(AnswerShippingQuery(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ShippingOption as ShippingOption
import qualified Data.Text as T

data AnswerShippingQuery -- ^ Sets the result of a shipping query; for bots only
  = AnswerShippingQuery
    { shipping_query_id :: Maybe Int                             -- ^ Identifier of the shipping query
    , shipping_options  :: Maybe [ShippingOption.ShippingOption] -- ^ Available shipping options
    , error_message     :: Maybe T.Text                          -- ^ An error message, empty on success
    }
  deriving (Eq)

instance Show AnswerShippingQuery where
  show
    AnswerShippingQuery
      { shipping_query_id = shipping_query_id_
      , shipping_options  = shipping_options_
      , error_message     = error_message_
      }
        = "AnswerShippingQuery"
          ++ I.cc
          [ "shipping_query_id" `I.p` shipping_query_id_
          , "shipping_options"  `I.p` shipping_options_
          , "error_message"     `I.p` error_message_
          ]

instance AT.ToJSON AnswerShippingQuery where
  toJSON
    AnswerShippingQuery
      { shipping_query_id = shipping_query_id_
      , shipping_options  = shipping_options_
      , error_message     = error_message_
      }
        = A.object
          [ "@type"             A..= AT.String "answerShippingQuery"
          , "shipping_query_id" A..= fmap I.writeInt64  shipping_query_id_
          , "shipping_options"  A..= shipping_options_
          , "error_message"     A..= error_message_
          ]
