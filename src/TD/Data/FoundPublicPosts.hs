module TD.Data.FoundPublicPosts
  (FoundPublicPosts(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Message as Message
import qualified Data.Text as T
import qualified TD.Data.PublicPostSearchLimits as PublicPostSearchLimits

data FoundPublicPosts
  = FoundPublicPosts -- ^ Contains a list of messages found by a public post search
    { messages            :: Maybe [Message.Message]                             -- ^ List of found public posts
    , next_offset         :: Maybe T.Text                                        -- ^ The offset for the next request. If empty, then there are no more results
    , search_limits       :: Maybe PublicPostSearchLimits.PublicPostSearchLimits -- ^ Updated public post search limits after the query; repeated requests with the same query will be free; may be null if they didn't change
    , are_limits_exceeded :: Maybe Bool                                          -- ^ True, if the query has failed because search limits are exceeded. In this case search_limits.daily_free_query_count will be equal to 0
    }
  deriving (Eq, Show)

instance I.ShortShow FoundPublicPosts where
  shortShow FoundPublicPosts
    { messages            = messages_
    , next_offset         = next_offset_
    , search_limits       = search_limits_
    , are_limits_exceeded = are_limits_exceeded_
    }
      = "FoundPublicPosts"
        ++ I.cc
        [ "messages"            `I.p` messages_
        , "next_offset"         `I.p` next_offset_
        , "search_limits"       `I.p` search_limits_
        , "are_limits_exceeded" `I.p` are_limits_exceeded_
        ]

instance AT.FromJSON FoundPublicPosts where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "foundPublicPosts" -> parseFoundPublicPosts v
      _                  -> mempty
    
    where
      parseFoundPublicPosts :: A.Value -> AT.Parser FoundPublicPosts
      parseFoundPublicPosts = A.withObject "FoundPublicPosts" $ \o -> do
        messages_            <- o A..:?  "messages"
        next_offset_         <- o A..:?  "next_offset"
        search_limits_       <- o A..:?  "search_limits"
        are_limits_exceeded_ <- o A..:?  "are_limits_exceeded"
        pure $ FoundPublicPosts
          { messages            = messages_
          , next_offset         = next_offset_
          , search_limits       = search_limits_
          , are_limits_exceeded = are_limits_exceeded_
          }
  parseJSON _ = mempty

