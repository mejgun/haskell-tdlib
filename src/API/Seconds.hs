-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Seconds where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains a value representing a number of seconds 
-- 
-- __seconds__ Number of seconds
data Seconds = 

 Seconds { seconds :: Maybe Float }  deriving (Eq)

instance Show Seconds where
 show Seconds { seconds=seconds } =
  "Seconds" ++ cc [p "seconds" seconds ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Seconds where
 toJSON Seconds { seconds = seconds } =
  A.object [ "@type" A..= T.String "seconds", "seconds" A..= seconds ]

instance T.FromJSON Seconds where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "seconds" -> parseSeconds v
   _ -> mempty
  where
   parseSeconds :: A.Value -> T.Parser Seconds
   parseSeconds = A.withObject "Seconds" $ \o -> do
    seconds <- o A..:? "seconds"
    return $ Seconds { seconds = seconds }
 parseJSON _ = mempty
