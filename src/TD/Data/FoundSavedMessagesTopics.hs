module TD.Data.FoundSavedMessagesTopics
  (FoundSavedMessagesTopics(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FoundSavedMessagesTopic as FoundSavedMessagesTopic
import qualified Data.Text as T

data FoundSavedMessagesTopics
  = FoundSavedMessagesTopics -- ^ Contains a list of Saved Messages topics
    { total_count :: Maybe Int                                               -- ^ Total number of Saved Messages topics found
    , topics      :: Maybe [FoundSavedMessagesTopic.FoundSavedMessagesTopic] -- ^ List of Saved Messages topics
    , next_offset :: Maybe T.Text                                            -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow FoundSavedMessagesTopics where
  shortShow FoundSavedMessagesTopics
    { total_count = total_count_
    , topics      = topics_
    , next_offset = next_offset_
    }
      = "FoundSavedMessagesTopics"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "topics"      `I.p` topics_
        , "next_offset" `I.p` next_offset_
        ]

instance AT.FromJSON FoundSavedMessagesTopics where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "foundSavedMessagesTopics" -> parseFoundSavedMessagesTopics v
      _                          -> mempty
    
    where
      parseFoundSavedMessagesTopics :: A.Value -> AT.Parser FoundSavedMessagesTopics
      parseFoundSavedMessagesTopics = A.withObject "FoundSavedMessagesTopics" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        topics_      <- o A..:?  "topics"
        next_offset_ <- o A..:?  "next_offset"
        pure $ FoundSavedMessagesTopics
          { total_count = total_count_
          , topics      = topics_
          , next_offset = next_offset_
          }
  parseJSON _ = mempty

