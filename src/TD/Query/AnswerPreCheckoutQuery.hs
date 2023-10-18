module TD.Query.AnswerPreCheckoutQuery
  (AnswerPreCheckoutQuery(..)
  , defaultAnswerPreCheckoutQuery
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Sets the result of a pre-checkout query; for bots only. Returns 'TD.Data.Ok.Ok'
data AnswerPreCheckoutQuery
  = AnswerPreCheckoutQuery
    { pre_checkout_query_id :: Maybe Int    -- ^ Identifier of the pre-checkout query
    , error_message         :: Maybe T.Text -- ^ An error message, empty on success
    }
  deriving (Eq, Show)

instance I.ShortShow AnswerPreCheckoutQuery where
  shortShow
    AnswerPreCheckoutQuery
      { pre_checkout_query_id = pre_checkout_query_id_
      , error_message         = error_message_
      }
        = "AnswerPreCheckoutQuery"
          ++ I.cc
          [ "pre_checkout_query_id" `I.p` pre_checkout_query_id_
          , "error_message"         `I.p` error_message_
          ]

instance AT.ToJSON AnswerPreCheckoutQuery where
  toJSON
    AnswerPreCheckoutQuery
      { pre_checkout_query_id = pre_checkout_query_id_
      , error_message         = error_message_
      }
        = A.object
          [ "@type"                 A..= AT.String "answerPreCheckoutQuery"
          , "pre_checkout_query_id" A..= fmap I.writeInt64  pre_checkout_query_id_
          , "error_message"         A..= error_message_
          ]

defaultAnswerPreCheckoutQuery :: AnswerPreCheckoutQuery
defaultAnswerPreCheckoutQuery =
  AnswerPreCheckoutQuery
    { pre_checkout_query_id = Nothing
    , error_message         = Nothing
    }

