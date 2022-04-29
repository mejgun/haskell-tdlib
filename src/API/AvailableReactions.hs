-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.AvailableReactions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Represents a list of available reactions 
-- 
-- __reactions__ List of reactions
data AvailableReactions = 

 AvailableReactions { reactions :: Maybe [String] }  deriving (Eq)

instance Show AvailableReactions where
 show AvailableReactions { reactions=reactions } =
  "AvailableReactions" ++ cc [p "reactions" reactions ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON AvailableReactions where
 toJSON AvailableReactions { reactions = reactions } =
  A.object [ "@type" A..= T.String "availableReactions", "reactions" A..= reactions ]

instance T.FromJSON AvailableReactions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "availableReactions" -> parseAvailableReactions v
   _ -> mempty
  where
   parseAvailableReactions :: A.Value -> T.Parser AvailableReactions
   parseAvailableReactions = A.withObject "AvailableReactions" $ \o -> do
    reactions <- o A..:? "reactions"
    return $ AvailableReactions { reactions = reactions }
 parseJSON _ = mempty
