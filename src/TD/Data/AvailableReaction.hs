{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AvailableReaction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data AvailableReaction = -- | Represents an available reaction @reaction Text representation of the reaction @needs_premium True, if Telegram Premium is needed to send the reaction
  AvailableReaction
  { -- |
    needs_premium :: Maybe Bool,
    -- |
    reaction :: Maybe String
  }
  deriving (Eq)

instance Show AvailableReaction where
  show
    AvailableReaction
      { needs_premium = needs_premium_,
        reaction = reaction_
      } =
      "AvailableReaction"
        ++ U.cc
          [ U.p "needs_premium" needs_premium_,
            U.p "reaction" reaction_
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
        reaction_ <- o A..:? "reaction"
        return $ AvailableReaction {needs_premium = needs_premium_, reaction = reaction_}
  parseJSON _ = mempty

instance T.ToJSON AvailableReaction where
  toJSON
    AvailableReaction
      { needs_premium = needs_premium_,
        reaction = reaction_
      } =
      A.object
        [ "@type" A..= T.String "availableReaction",
          "needs_premium" A..= needs_premium_,
          "reaction" A..= reaction_
        ]
