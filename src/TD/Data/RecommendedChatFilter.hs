{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.RecommendedChatFilter where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatFilter as ChatFilter
import qualified Utils as U

-- |
data RecommendedChatFilter = -- | Describes a recommended chat filter @filter The chat filter @param_description Chat filter description
  RecommendedChatFilter
  { -- |
    description :: Maybe String,
    -- |
    _filter :: Maybe ChatFilter.ChatFilter
  }
  deriving (Eq)

instance Show RecommendedChatFilter where
  show
    RecommendedChatFilter
      { description = description_,
        _filter = _filter_
      } =
      "RecommendedChatFilter"
        ++ U.cc
          [ U.p "description" description_,
            U.p "_filter" _filter_
          ]

instance T.FromJSON RecommendedChatFilter where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "recommendedChatFilter" -> parseRecommendedChatFilter v
      _ -> mempty
    where
      parseRecommendedChatFilter :: A.Value -> T.Parser RecommendedChatFilter
      parseRecommendedChatFilter = A.withObject "RecommendedChatFilter" $ \o -> do
        description_ <- o A..:? "description"
        _filter_ <- o A..:? "filter"
        return $ RecommendedChatFilter {description = description_, _filter = _filter_}
  parseJSON _ = mempty

instance T.ToJSON RecommendedChatFilter where
  toJSON
    RecommendedChatFilter
      { description = description_,
        _filter = _filter_
      } =
      A.object
        [ "@type" A..= T.String "recommendedChatFilter",
          "description" A..= description_,
          "filter" A..= _filter_
        ]
