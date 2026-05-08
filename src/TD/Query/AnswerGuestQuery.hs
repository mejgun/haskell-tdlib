module TD.Query.AnswerGuestQuery
  (AnswerGuestQuery(..)
  , defaultAnswerGuestQuery
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputInlineQueryResult as InputInlineQueryResult

-- | Sets the result of a guest query; for bots only. Returns 'TD.Data.InlineMessageId.InlineMessageId'
data AnswerGuestQuery
  = AnswerGuestQuery
    { guest_query_id :: Maybe Int                                           -- ^ Identifier of the guest query
    , result         :: Maybe InputInlineQueryResult.InputInlineQueryResult -- ^ The result of the query
    }
  deriving (Eq, Show)

instance I.ShortShow AnswerGuestQuery where
  shortShow
    AnswerGuestQuery
      { guest_query_id = guest_query_id_
      , result         = result_
      }
        = "AnswerGuestQuery"
          ++ I.cc
          [ "guest_query_id" `I.p` guest_query_id_
          , "result"         `I.p` result_
          ]

instance AT.ToJSON AnswerGuestQuery where
  toJSON
    AnswerGuestQuery
      { guest_query_id = guest_query_id_
      , result         = result_
      }
        = A.object
          [ "@type"          A..= AT.String "answerGuestQuery"
          , "guest_query_id" A..= fmap I.writeInt64  guest_query_id_
          , "result"         A..= result_
          ]

defaultAnswerGuestQuery :: AnswerGuestQuery
defaultAnswerGuestQuery =
  AnswerGuestQuery
    { guest_query_id = Nothing
    , result         = Nothing
    }

