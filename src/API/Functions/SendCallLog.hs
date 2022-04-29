-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendCallLog where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- Sends log file for a call to Telegram servers 
-- 
-- __call_id__ Call identifier
-- 
-- __log_file__ Call log file. Only inputFileLocal and inputFileGenerated are supported
data SendCallLog = 

 SendCallLog { log_file :: Maybe InputFile.InputFile, call_id :: Maybe Int }  deriving (Eq)

instance Show SendCallLog where
 show SendCallLog { log_file=log_file, call_id=call_id } =
  "SendCallLog" ++ cc [p "log_file" log_file, p "call_id" call_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SendCallLog where
 toJSON SendCallLog { log_file = log_file, call_id = call_id } =
  A.object [ "@type" A..= T.String "sendCallLog", "log_file" A..= log_file, "call_id" A..= call_id ]

instance T.FromJSON SendCallLog where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendCallLog" -> parseSendCallLog v
   _ -> mempty
  where
   parseSendCallLog :: A.Value -> T.Parser SendCallLog
   parseSendCallLog = A.withObject "SendCallLog" $ \o -> do
    log_file <- o A..:? "log_file"
    call_id <- mconcat [ o A..:? "call_id", readMaybe <$> (o A..: "call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendCallLog { log_file = log_file, call_id = call_id }
 parseJSON _ = mempty
