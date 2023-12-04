module TD.Data.FoundChatBoosts
  (FoundChatBoosts(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatBoost as ChatBoost
import qualified Data.Text as T

data FoundChatBoosts
  = FoundChatBoosts -- ^ Contains a list of boosts applied to a chat
    { total_count :: Maybe Int                   -- ^ Total number of boosts applied to the chat
    , boosts      :: Maybe [ChatBoost.ChatBoost] -- ^ List of boosts
    , next_offset :: Maybe T.Text                -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow FoundChatBoosts where
  shortShow FoundChatBoosts
    { total_count = total_count_
    , boosts      = boosts_
    , next_offset = next_offset_
    }
      = "FoundChatBoosts"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "boosts"      `I.p` boosts_
        , "next_offset" `I.p` next_offset_
        ]

instance AT.FromJSON FoundChatBoosts where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "foundChatBoosts" -> parseFoundChatBoosts v
      _                 -> mempty
    
    where
      parseFoundChatBoosts :: A.Value -> AT.Parser FoundChatBoosts
      parseFoundChatBoosts = A.withObject "FoundChatBoosts" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        boosts_      <- o A..:?  "boosts"
        next_offset_ <- o A..:?  "next_offset"
        pure $ FoundChatBoosts
          { total_count = total_count_
          , boosts      = boosts_
          , next_offset = next_offset_
          }
  parseJSON _ = mempty

