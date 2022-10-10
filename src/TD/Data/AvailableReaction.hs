{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AvailableReaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ReactionType as ReactionType
import qualified Utils as U

-- |
data AvailableReaction = -- | Represents an available reaction @type Type of the reaction @needs_premium True, if Telegram Premium is needed to send the reaction
  AvailableReaction
  { -- |
    needs_premium :: Maybe Bool,
    -- |
    _type :: Maybe ReactionType.ReactionType
  }
  deriving (Eq)

instance Show AvailableReaction where
  show
    AvailableReaction
      { needs_premium = needs_premium_,
        _type = _type_
      } =
      "AvailableReaction"
        ++ U.cc
          [ U.p "needs_premium" needs_premium_,
            U.p "_type" _type_
          ]

instance T.FromJSON AvailableReaction where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "availableReaction" -> parseAvailableReaction v
      _ -> mempty
    where
      parseAvailableReaction :: A.Value -> T.Parser AvailableReaction
      parseAvailableReaction = A.withObject "AvailableReaction" $ \o -> do
        needs_premium_ <- o A..:? "needs_premium"
        _type_ <- o A..:? "type"
        return $ AvailableReaction {needs_premium = needs_premium_, _type = _type_}
  parseJSON _ = mempty

instance T.ToJSON AvailableReaction where
  toJSON
    AvailableReaction
      { needs_premium = needs_premium_,
        _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "availableReaction",
          "needs_premium" A..= needs_premium_,
          "type" A..= _type_
        ]
