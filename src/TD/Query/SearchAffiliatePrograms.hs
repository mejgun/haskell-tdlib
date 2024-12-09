module TD.Query.SearchAffiliatePrograms
  (SearchAffiliatePrograms(..)
  , defaultSearchAffiliatePrograms
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AffiliateProgramSortOrder as AffiliateProgramSortOrder
import qualified Data.Text as T

-- | Searches affiliate programs that can be applied to the given chat. Returns 'TD.Data.FoundAffiliatePrograms.FoundAffiliatePrograms'
data SearchAffiliatePrograms
  = SearchAffiliatePrograms
    { chat_id    :: Maybe Int                                                 -- ^ Identifier of the chat for which affiliate programs are searched for. Can be an identifier of the Saved Messages chat, of a chat with an owned bot, or of a channel chat with can_post_messages administrator right
    , sort_order :: Maybe AffiliateProgramSortOrder.AffiliateProgramSortOrder -- ^ Sort order for the results
    , offset     :: Maybe T.Text                                              -- ^ Offset of the first affiliate program to return as received from the previous request; use empty string to get the first chunk of results
    , limit      :: Maybe Int                                                 -- ^ The maximum number of affiliate programs to return
    }
  deriving (Eq, Show)

instance I.ShortShow SearchAffiliatePrograms where
  shortShow
    SearchAffiliatePrograms
      { chat_id    = chat_id_
      , sort_order = sort_order_
      , offset     = offset_
      , limit      = limit_
      }
        = "SearchAffiliatePrograms"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "sort_order" `I.p` sort_order_
          , "offset"     `I.p` offset_
          , "limit"      `I.p` limit_
          ]

instance AT.ToJSON SearchAffiliatePrograms where
  toJSON
    SearchAffiliatePrograms
      { chat_id    = chat_id_
      , sort_order = sort_order_
      , offset     = offset_
      , limit      = limit_
      }
        = A.object
          [ "@type"      A..= AT.String "searchAffiliatePrograms"
          , "chat_id"    A..= chat_id_
          , "sort_order" A..= sort_order_
          , "offset"     A..= offset_
          , "limit"      A..= limit_
          ]

defaultSearchAffiliatePrograms :: SearchAffiliatePrograms
defaultSearchAffiliatePrograms =
  SearchAffiliatePrograms
    { chat_id    = Nothing
    , sort_order = Nothing
    , offset     = Nothing
    , limit      = Nothing
    }

