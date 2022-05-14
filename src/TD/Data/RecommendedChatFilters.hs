{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.RecommendedChatFilters where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.RecommendedChatFilter as RecommendedChatFilter
import qualified Utils as U

-- |
data RecommendedChatFilters = -- | Contains a list of recommended chat filters @chat_filters List of recommended chat filters
  RecommendedChatFilters
  { -- |
    chat_filters :: Maybe [RecommendedChatFilter.RecommendedChatFilter]
  }
  deriving (Eq)

instance Show RecommendedChatFilters where
  show
    RecommendedChatFilters
      { chat_filters = chat_filters_
      } =
      "RecommendedChatFilters"
        ++ U.cc
          [ U.p "chat_filters" chat_filters_
          ]

instance T.FromJSON RecommendedChatFilters where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "recommendedChatFilters" -> parseRecommendedChatFilters v
      _ -> mempty
    where
      parseRecommendedChatFilters :: A.Value -> T.Parser RecommendedChatFilters
      parseRecommendedChatFilters = A.withObject "RecommendedChatFilters" $ \o -> do
        chat_filters_ <- o A..:? "chat_filters"
        return $ RecommendedChatFilters {chat_filters = chat_filters_}
  parseJSON _ = mempty

instance T.ToJSON RecommendedChatFilters where
  toJSON
    RecommendedChatFilters
      { chat_filters = chat_filters_
      } =
      A.object
        [ "@type" A..= T.String "recommendedChatFilters",
          "chat_filters" A..= chat_filters_
        ]
