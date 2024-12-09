module TD.Data.ChatAffiliatePrograms
  (ChatAffiliatePrograms(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatAffiliateProgram as ChatAffiliateProgram
import qualified Data.Text as T

data ChatAffiliatePrograms
  = ChatAffiliatePrograms -- ^ Represents a list of affiliate programs that were connected to a chat
    { total_count :: Maybe Int                                         -- ^ The total number of affiliate programs that were connected to the chat
    , programs    :: Maybe [ChatAffiliateProgram.ChatAffiliateProgram] -- ^ The list of connected affiliate programs
    , next_offset :: Maybe T.Text                                      -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow ChatAffiliatePrograms where
  shortShow ChatAffiliatePrograms
    { total_count = total_count_
    , programs    = programs_
    , next_offset = next_offset_
    }
      = "ChatAffiliatePrograms"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "programs"    `I.p` programs_
        , "next_offset" `I.p` next_offset_
        ]

instance AT.FromJSON ChatAffiliatePrograms where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatAffiliatePrograms" -> parseChatAffiliatePrograms v
      _                       -> mempty
    
    where
      parseChatAffiliatePrograms :: A.Value -> AT.Parser ChatAffiliatePrograms
      parseChatAffiliatePrograms = A.withObject "ChatAffiliatePrograms" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        programs_    <- o A..:?  "programs"
        next_offset_ <- o A..:?  "next_offset"
        pure $ ChatAffiliatePrograms
          { total_count = total_count_
          , programs    = programs_
          , next_offset = next_offset_
          }
  parseJSON _ = mempty

