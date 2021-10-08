-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Updates where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Update as Update

-- |
-- 
-- Contains a list of updates 
-- 
-- __updates__ List of updates
data Updates = 

 Updates { updates :: Maybe [Update.Update] }  deriving (Eq)

instance Show Updates where
 show Updates { updates=updates } =
  "Updates" ++ cc [p "updates" updates ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Updates where
 toJSON Updates { updates = updates } =
  A.object [ "@type" A..= T.String "updates", "updates" A..= updates ]

instance T.FromJSON Updates where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "updates" -> parseUpdates v
   _ -> mempty
  where
   parseUpdates :: A.Value -> T.Parser Updates
   parseUpdates = A.withObject "Updates" $ \o -> do
    updates <- o A..:? "updates"
    return $ Updates { updates = updates }
 parseJSON _ = mempty
