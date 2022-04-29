-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleAllDownloadsArePaused where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Changes pause state of all files in the file download list 
-- 
-- __are_paused__ Pass true to pause all downloads; pass false to unpause them
data ToggleAllDownloadsArePaused = 

 ToggleAllDownloadsArePaused { are_paused :: Maybe Bool }  deriving (Eq)

instance Show ToggleAllDownloadsArePaused where
 show ToggleAllDownloadsArePaused { are_paused=are_paused } =
  "ToggleAllDownloadsArePaused" ++ cc [p "are_paused" are_paused ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ToggleAllDownloadsArePaused where
 toJSON ToggleAllDownloadsArePaused { are_paused = are_paused } =
  A.object [ "@type" A..= T.String "toggleAllDownloadsArePaused", "are_paused" A..= are_paused ]

instance T.FromJSON ToggleAllDownloadsArePaused where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleAllDownloadsArePaused" -> parseToggleAllDownloadsArePaused v
   _ -> mempty
  where
   parseToggleAllDownloadsArePaused :: A.Value -> T.Parser ToggleAllDownloadsArePaused
   parseToggleAllDownloadsArePaused = A.withObject "ToggleAllDownloadsArePaused" $ \o -> do
    are_paused <- o A..:? "are_paused"
    return $ ToggleAllDownloadsArePaused { are_paused = are_paused }
 parseJSON _ = mempty
