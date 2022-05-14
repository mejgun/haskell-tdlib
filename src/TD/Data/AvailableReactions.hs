{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AvailableReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data AvailableReactions = -- | Represents a list of available reactions @reactions List of reactions
  AvailableReactions
  { -- |
    reactions :: Maybe [String]
  }
  deriving (Eq)

instance Show AvailableReactions where
  show
    AvailableReactions
      { reactions = reactions_
      } =
      "AvailableReactions"
        ++ U.cc
          [ U.p "reactions" reactions_
          ]

instance T.FromJSON AvailableReactions where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "availableReactions" -> parseAvailableReactions v
      _ -> mempty
    where
      parseAvailableReactions :: A.Value -> T.Parser AvailableReactions
      parseAvailableReactions = A.withObject "AvailableReactions" $ \o -> do
        reactions_ <- o A..:? "reactions"
        return $ AvailableReactions {reactions = reactions_}
  parseJSON _ = mempty

instance T.ToJSON AvailableReactions where
  toJSON
    AvailableReactions
      { reactions = reactions_
      } =
      A.object
        [ "@type" A..= T.String "availableReactions",
          "reactions" A..= reactions_
        ]
