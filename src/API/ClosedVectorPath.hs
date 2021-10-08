-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ClosedVectorPath where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.VectorPathCommand as VectorPathCommand

-- |
-- 
-- Represents a closed vector path. The path begins at the end point of the last command 
-- 
-- __commands__ List of vector path commands
data ClosedVectorPath = 

 ClosedVectorPath { commands :: Maybe [VectorPathCommand.VectorPathCommand] }  deriving (Eq)

instance Show ClosedVectorPath where
 show ClosedVectorPath { commands=commands } =
  "ClosedVectorPath" ++ cc [p "commands" commands ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ClosedVectorPath where
 toJSON ClosedVectorPath { commands = commands } =
  A.object [ "@type" A..= T.String "closedVectorPath", "commands" A..= commands ]

instance T.FromJSON ClosedVectorPath where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "closedVectorPath" -> parseClosedVectorPath v
   _ -> mempty
  where
   parseClosedVectorPath :: A.Value -> T.Parser ClosedVectorPath
   parseClosedVectorPath = A.withObject "ClosedVectorPath" $ \o -> do
    commands <- o A..:? "commands"
    return $ ClosedVectorPath { commands = commands }
 parseJSON _ = mempty
