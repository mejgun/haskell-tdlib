{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.FoundChatBoosts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatBoost as ChatBoost
import qualified Utils as U

-- |
data FoundChatBoosts = -- | Contains a list of boosts applied to a chat @total_count Total number of boosts applied to the chat @boosts List of boosts @next_offset The offset for the next request. If empty, there are no more results
  FoundChatBoosts
  { -- |
    next_offset :: Maybe String,
    -- |
    boosts :: Maybe [ChatBoost.ChatBoost],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show FoundChatBoosts where
  show
    FoundChatBoosts
      { next_offset = next_offset_,
        boosts = boosts_,
        total_count = total_count_
      } =
      "FoundChatBoosts"
        ++ U.cc
          [ U.p "next_offset" next_offset_,
            U.p "boosts" boosts_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON FoundChatBoosts where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "foundChatBoosts" -> parseFoundChatBoosts v
      _ -> mempty
    where
      parseFoundChatBoosts :: A.Value -> T.Parser FoundChatBoosts
      parseFoundChatBoosts = A.withObject "FoundChatBoosts" $ \o -> do
        next_offset_ <- o A..:? "next_offset"
        boosts_ <- o A..:? "boosts"
        total_count_ <- o A..:? "total_count"
        return $ FoundChatBoosts {next_offset = next_offset_, boosts = boosts_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON FoundChatBoosts where
  toJSON
    FoundChatBoosts
      { next_offset = next_offset_,
        boosts = boosts_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "foundChatBoosts",
          "next_offset" A..= next_offset_,
          "boosts" A..= boosts_,
          "total_count" A..= total_count_
        ]
