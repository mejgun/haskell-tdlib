{-# LANGUAGE OverloadedStrings #-}

module TD.Data.ClosedVectorPath where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.VectorPathCommand as VectorPathCommand
import qualified Utils as U

data ClosedVectorPath = -- | Represents a closed vector path. The path begins at the end point of the last command @commands List of vector path commands
  ClosedVectorPath
  { -- |
    commands :: Maybe [VectorPathCommand.VectorPathCommand]
  }
  deriving (Eq)

instance Show ClosedVectorPath where
  show
    ClosedVectorPath
      { commands = commands
      } =
      "ClosedVectorPath"
        ++ U.cc
          [ U.p "commands" commands
          ]

instance T.FromJSON ClosedVectorPath where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "closedVectorPath" -> parseClosedVectorPath v
      _ -> mempty
    where
      parseClosedVectorPath :: A.Value -> T.Parser ClosedVectorPath
      parseClosedVectorPath = A.withObject "ClosedVectorPath" $ \o -> do
        commands_ <- o A..:? "commands"
        return $ ClosedVectorPath {commands = commands_}
  parseJSON _ = mempty

instance T.ToJSON ClosedVectorPath where
  toJSON
    ClosedVectorPath
      { commands = commands
      } =
      A.object
        [ "@type" A..= T.String "closedVectorPath",
          "commands" A..= commands
        ]
